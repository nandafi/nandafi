package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	"sopingi.com/models"
)

type BrgInput struct {
	No_id       string `json:"no_id"`
	Title       string `json:"title"`
	Category    string `json:"category"`
	Description string `json:"description"`
	Thumbnail   string `json:"thumbnail"`
	Tag         string `json:"tag"`
	Price       int    `json:"price"`
}

//tampildata
func BrgShow(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	var brg []models.Brg
	db.Find(&brg)
	c.JSON(http.StatusOK, gin.H{"data": brg})
}

//find the record by filter/ params
func BrgSearch(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	brgx := ""
	brgx = c.Param("cari")

	var brg []models.Brg
	//db.Where("no_id LIKE ?", "%"+brgx+"%").Or("title LIKE ?", "%"+brgx+"%").Find(&brg) //cari by no_id/title
	db.Where("no_id = ?", brgx).Find(&brg)
	c.JSON(http.StatusOK, gin.H{"data": brg})

}

//find the record by filter/ params
func BrgSearchCategory(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	brgx := ""
	brgx = c.Param("cari")

	var brg []models.Brg
	db.Where("category LIKE ?", "%"+brgx+"%").Order(" NO_ID DESC ").Find(&brg)
	c.JSON(http.StatusOK, gin.H{"data": brg})

}

//first name of the func must be Uppercase

//add data
func BrgAdd(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	//input validation
	var dataInput BrgInput
	if err := c.ShouldBindJSON(&dataInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	//input process
	brg := models.Brg{
		No_id:       dataInput.No_id,
		Title:       dataInput.Title,
		Category:    dataInput.Category,
		Description: dataInput.Description,
		Thumbnail:   dataInput.Thumbnail,
		Tag:         dataInput.Tag,
		Price:       dataInput.Price,
	}

	db.Create(&brg)

	c.JSON(http.StatusOK, gin.H{"data": brg})
}

//edit data
func BrgEdit(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	//cek datanya dulu
	var brg models.Brg
	if err := db.Where("no_id = ?", c.Param("no_id")).First(&brg).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Data barang tidak ditemukan"})
		return
	}

	//validasi input
	var dataInput BrgInput
	if err := c.ShouldBindJSON(&dataInput); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	//proses ubah data
	db.Model(&brg).Update(dataInput)

	c.JSON(http.StatusOK, gin.H{"data": brg})
}

//delete data
func BrgDelete(c *gin.Context) {
	db := c.MustGet("db").(*gorm.DB)

	//cek datanya dulu
	var brg models.Brg
	if err := db.Where("no_id = ?", c.Param("no_id")).First(&brg).Error; err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Data barang tidak ditemukan!"})
		return
	}

	//process to delete data
	db.Delete(&brg)
	c.JSON(http.StatusOK, gin.H{"data": true})
}
