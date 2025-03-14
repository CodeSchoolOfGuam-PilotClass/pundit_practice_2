i = 1
5.times do
  Product.create(
    name: "Product #{i}",
    price: i + 10,
    published: true
  )
  i += 1
end
j = 6
5.times do
  Product.create(
    name: "Product #{j}",
    price: i + 10,
    published: false
  )
  i += 1
end
