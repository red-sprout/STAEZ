<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div id="load">
        <img src="${pageContext.request.contextPath}/resources/img/concert/loading.gif" alt="loading">
    </div>
      
      <script >
        window.onload = function() {
        const loadingPage = document.getElementById('load');
        loadingPage.style.display = 'none';
        };
      </script>

      <style>
        #load {
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            position: fixed;
            display: block;
            opacity: 0.8;
            background: white;
            z-index: 99;
            text-align: center;
        }

        #load > img {
            position: absolute;
            top: 50%;
            left: 50%;
        z-index: 100;
      }
    </style>
</body>
</html>