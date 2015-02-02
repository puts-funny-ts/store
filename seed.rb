require 'pry'
require 'active_record'
require_relative './models/connection'
require_relative './models/buyers'
require_relative './models/purchases'
require_relative './models/t_name'
require_relative './models/t_type'

love = Tname.create({
  name: "Love",
  price: 37,
  image_url: "http://moonboybrand.com/zencart/images/loop_love.jpg",
  available: TRUE
  })

lightbulb = Tname.create({
  name: "lightbulb",
  price: 42,
  image_url: "http://rlv.zcache.com/c_programmer_light_bulb_joke_tee_shirt-rf8348a4db5154109a52acc04386a03ae_804gs_512.jpg",
  available: TRUE
  })

chocolate = Tname.create({
    name: "Chocolate",
    price: 52,
    image_url: "http://orbitwholesale.co.uk/shop/AmazonImages/B-2000-186-D-LPI.jpg",
    available: TRUE
    })
dino = Tname.create({
      name: "Dino",
      price: 72,
      image_url: "http://image5.spreadshirt.com/image-server/v1/products/106669528/views/1,width=1200,height=1200,appearanceId=258/I-Love-Dinosaurs-(IE)-T-Shirts.jpg",
      available: TRUE
      })

color= ["crimson", "blue steel", "turquoise"]
Ttype.create({
   color: "crimson",
   gender: "M",
   size: "MD",
   tname_id: love.id,
   quantity: 10
})

Ttype.create({
  color: "crimson",
  gender: "M",
  size: "SM",
  tname_id: love.id,
  quantity: 10
  })
Ttype.create({
    color: "crimson",
    gender: "M",
    size: "LG",
    tname_id: love.id,
    quantity: 10
    })
Ttype.create({
      color: "crimson",
      gender: "F",
      size: "MD",
      tname_id: love.id,
      quantity: 10
      })

Ttype.create({
        color: "crimson",
        gender: "F",
        size: "SM",
        tname_id: love.id,
        quantity: 10
        })
        Ttype.create({
          color: "crimson",
          gender: "F",
          size: "LG",
          tname_id: love.id,
          quantity: 10
          })
          Ttype.create({
            color: "Blue Steel",
            gender: "M",
            size: "MD",
            tname_id: love.id,
            quantity: 10
            })
