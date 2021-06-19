package models

type Brg struct {
	No_id       string `json:"no_id" gorm:"primary_key"`
	Title       string `json:"title"`
	Category    string `json:"category"`
	Description string `json:"description"`
	Thumbnail   string `json:"thumbnail"`
	Tag         string `json:"tag"`
	Price       int    `json:"price"`
}
