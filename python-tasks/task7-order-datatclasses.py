from dataclasses import dataclass


@dataclass
class Product:
    name: str
    price: float


@dataclass
class OrderLine:
    product: Product
    quantity: int

    def subtotal(self):
        return self.product.price * self.quantity


@dataclass
class Order:
    lines: list

    def add_line(self, product, quantity):
        line = OrderLine(product, quantity)
        self.lines.append(line)

    def total(self):
        total = 0

        for line in self.lines:
            total += line.subtotal()

        return total


order = Order([])

laptop = Product("Laptop", 500)
mouse = Product("Mouse", 15)
keyboard = Product("Keyboard", 30)

order.add_line(laptop, 1)
order.add_line(mouse, 2)
order.add_line(keyboard, 1)

print("Receipt")
print("-------")

for line in order.lines:
    print(line.product.name, "x", line.quantity, "=", line.subtotal(), "JD")

print("-------")
print("Total =", order.total(), "JD")

# Sample output:
# Receipt
# -------
# Laptop x 1 = 500 JD
# Mouse x 2 = 30 JD
# Keyboard x 1 = 30 JD
# -------
# Total = 560 JD
