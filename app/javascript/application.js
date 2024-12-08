// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "trix";
import "@rails/actiontext";

console.log("Hello from importmap-rails!");

function loadPDFObjectScript(callback) {
  const script = document.createElement("script");
  script.src =
    "https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.3.0/pdfobject.min.js";
  script.onload = callback;
  document.head.appendChild(script);
}

document.addEventListener("DOMContentLoaded", () => {
  loadPDFObjectScript(() => {
    const container = document.getElementById("pdf-container");
    const pdfBase64 = container.getAttribute("data-pdf-base64");

    if (pdfBase64) {
      loadPDFObjectScript(() => {
        PDFObject.embed(pdfBase64, "#pdf-container");
      });
    } else {
      console.error("No PDF base64 string found.");
    }
  });
});
