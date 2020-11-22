function calc (){
  const item_price  = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit_price = document.getElementById("profit");
  item_price.addEventListener("keyup", () => {
    const price =  item_price.value;
    const tax = Math.round(price * 0.1);
    const Profit = price - tax;
    add_tax_price.innerHTML = tax;
    profit_price.innerHTML = Profit;
  });
}

setInterval(calc, 1000);