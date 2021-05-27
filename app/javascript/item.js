window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = document.getElementById('add-tax-price');
    fee.innerHTML = Math.round(inputValue / 10);
    const profit = document.getElementById('profit')
    profit.innerHTML = Math.round(inputValue - (inputValue / 10));
  });
});