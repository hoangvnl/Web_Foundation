const { mode } = require("crypto-js");

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
    }
}