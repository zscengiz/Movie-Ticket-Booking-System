// JavaScript ile girilen URL'yi alıp <img> elementine atama işlemi
document.getElementById('posterUrl').addEventListener('input', function() {
    var posterUrl = this.value;
    document.getElementById('posterPreview').src = posterUrl;
});
