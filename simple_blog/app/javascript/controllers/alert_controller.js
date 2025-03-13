<script>
  document.addEventListener("DOMContentLoaded", function() {
    setTimeout(function() {
      let alerts = document.querySelectorAll(".alert");
      alerts.forEach(function(alert) {
        alert.style.transition = "opacity 1s";
        alert.style.opacity = "0";
        setTimeout(() => alert.remove(), 1000);
      });
    }, 3000);
  });
</script>
