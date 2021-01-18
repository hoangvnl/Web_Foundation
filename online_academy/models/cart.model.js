module.exports = {
    add(cart, item) {
        cart.push(item);
    },
    del(cart, item) {
        for (var i = cart.length - 1; i >= 0; i--) {
            if (item.CourseID === cart[i].CourseID) {
                cart.splice(i, 1);
                return;
            }
        }
    },
    count(cart) {
        return cart.length;
    },
    total(cart) {
        var price = 0, off = 0;
        for (item of cart) {
            if (+item.SalePrice != -1) {
                price += (+item.SalePrice);
                off += (+item.Price);
            }
            else {
                price += (+item.Price);
            }
        }
        return { price, off };
    }
}