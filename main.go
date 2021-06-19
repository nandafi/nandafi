package main

import (
	"log"
	"net/http"
	"time"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"sopingi.com/controllers"
	"sopingi.com/models"
)

type login struct {
	Username string `form:"username" json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

var identityKey = "id"

// User demo
type User struct {
	UserName  string
	FirstName string
	LastName  string
}

func main() {
	r := gin.Default()

	// the jwt middleware
	authMiddleware, err := jwt.New(&jwt.GinJWTMiddleware{
		Realm:       "Sopingi zone",
		Key:         []byte("3d10a600eb814ba3a13498836a182d1f"), //random
		Timeout:     time.Hour,                                  //token berlaku satu jam
		MaxRefresh:  time.Hour,
		IdentityKey: identityKey,
		PayloadFunc: func(data interface{}) jwt.MapClaims {
			if v, ok := data.(*User); ok {
				return jwt.MapClaims{
					identityKey: v.UserName,
				}
			}
			return jwt.MapClaims{}
		},
		IdentityHandler: func(c *gin.Context) interface{} {
			claims := jwt.ExtractClaims(c)
			return &User{
				UserName: claims[identityKey].(string),
			}
		},
		Authenticator: func(c *gin.Context) (interface{}, error) {
			var loginVals login
			if err := c.ShouldBind(&loginVals); err != nil {
				return "", jwt.ErrMissingLoginValues
			}
			userID := loginVals.Username
			password := loginVals.Password

			if (userID == "admin" && password == "admin") || (userID == "test" && password == "test") {
				return &User{
					UserName:  userID,
					LastName:  "Bo-Yi",
					FirstName: "Wu",
				}, nil
			}

			return nil, jwt.ErrFailedAuthentication
		},
		Authorizator: func(data interface{}, c *gin.Context) bool {
			if v, ok := data.(*User); ok && v.UserName == "admin" {
				return true
			}

			return false
		},
		Unauthorized: func(c *gin.Context, code int, message string) {
			c.JSON(code, gin.H{
				"code":    code,
				"message": message,
			})
		},

		TokenLookup:   "header: Authorization, query: token, cookie: jwt",
		TokenHeadName: "Bearer",
		TimeFunc:      time.Now,
	})

	if err != nil {
		log.Fatal("JWT Error:" + err.Error())
	}

	// When you use jwt.New(), the function is already automatically called for checking,
	// which means you don't need to call it again.
	errInit := authMiddleware.MiddlewareInit()

	if errInit != nil {
		log.Fatal("authMiddleware.MiddlewareInit() Error:" + errInit.Error())
	}

	r.POST("/login", authMiddleware.LoginHandler)

	r.NoRoute(authMiddleware.MiddlewareFunc(), func(c *gin.Context) {
		claims := jwt.ExtractClaims(c)
		log.Printf("NoRoute claims: %#v\n", claims)
		c.JSON(404, gin.H{"code": "PAGE_NOT_FOUND", "message": "Page not found"})
	})

	//Model ---------------------------------------
	db := models.SetupModels()

	//inisialisasi db
	r.Use(func(c *gin.Context) {
		c.Set("db", db)
		c.Next()
	})

	auth := r.Group("/auth")
	// Refresh time can be longer than token timeout
	auth.GET("/refresh_token", authMiddleware.RefreshHandler)
	auth.Use(authMiddleware.MiddlewareFunc())
	{
		auth.GET("/hello", func(c *gin.Context) {
			c.JSON(http.StatusOK, gin.H{"data": "Berhasil masuk #token"})
		})

		//mahasiswa table
		auth.GET("/mahasiswa", controllers.MahasiswaTampil) //route ke controllers/mahasiswaTampil
		auth.POST("/mahasiswa", controllers.MahasiswaTambah)
		auth.PUT("/mahasiswa/:nim", controllers.MahasiswaUbah) //edit data
		auth.DELETE("/mahasiswa/:nim", controllers.MahasiswaHapus)

		//brg table
		auth.GET("/brg", controllers.BrgShow)                     //list
		auth.GET("/brg/:cari", controllers.BrgSearch)             //Search by all kerword
		auth.GET("/brg_cat/:cari", controllers.BrgSearchCategory) //Filter by Category

		auth.POST("/brg", controllers.BrgAdd)             //add
		auth.PUT("/brg/:no_id", controllers.BrgEdit)      //edit - update
		auth.DELETE("/brg/:no_id", controllers.BrgDelete) //remove

	}

	//root
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"data": "Hello World"})
	})

	r.Run()
}
