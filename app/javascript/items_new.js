function price(){

   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
  
    priceInput.addEventListener('keyup', () => {
         const price = priceInput.value;
         
      if (price >= 300 && price <= 9999999){
         let fee = price * 0.1
         let gains = price - fee
         add_tax.textContent = fee;
         profit.textContent = gains;
      } else {
       let fee = '0';
       let gains = '0';
       add_tax.textContent = fee;
       profit.textContent = gains;
      }
    });
  
}
window.addEventListener("load", price);
