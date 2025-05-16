<%@ page import="java.util.*, inputan.Film" %>
<%
    String nama = request.getParameter("nama");
    int filmIndex = Integer.parseInt(request.getParameter("filmIndex"));
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));

    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
    Film filmDipilih = filmList.get(filmIndex);
    int totalHarga = jumlah * filmDipilih.harga;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struk Pemesanan Tiket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Bioskop Mardira</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="mb-4">Struk Pemesanan Tiket</h2>
        <ul class="list-group">
            <li class="list-group-item"><strong>Nama:</strong> <%= nama %></li>
            <li class="list-group-item"><strong>Film:</strong> <%= filmDipilih.judul %></li>
            <li class="list-group-item"><strong>Genre:</strong> <%= filmDipilih.genre %></li>
            <li class="list-group-item"><strong>Jam Tayang:</strong> <%= jam %></li>
            <li class="list-group-item"><strong>Jumlah Tiket:</strong> <%= jumlah %></li>
            <li class="list-group-item"><strong>Total Bayar:</strong> Rp <%= totalHarga %></li>
        </ul>
        <div class="mt-4">
            <a href="index.jsp" class="btn btn-primary">Kembali ke Beranda</a>
        </div>
    </div>
</div>
</body>
</html>
