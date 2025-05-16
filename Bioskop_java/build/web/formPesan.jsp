<%@ page import="java.util.*, inputan.Film" %>
<%
    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"> Bioskop Mardira</a>
    </div>
</nav>

<div class="container">
    <h2>Form Pemesanan Tiket</h2>
    <form action="struk.jsp" method="post" class="mt-3">
        <div class="mb-3">
            <label class="form-label">Nama</label>
            <input type="text" class="form-control" name="nama" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Film</label>
            <select id="filmSelect" name="filmIndex" class="form-select" onchange="updateJamTayang()" required>
                <% for (int i = 0; i < filmList.size(); i++) { %>
                    <option value="<%= i %>"><%= filmList.get(i).judul %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Jam Tayang</label>
            <select id="jamSelect" name="jam" class="form-select" required></select>
        </div>

        <div class="mb-3">
            <label class="form-label">Jumlah Tiket</label>
            <input type="number" class="form-control" name="jumlah" min="1" required>
        </div>

        <button type="submit" class="btn btn-success">Pesan Tiket</button>
    </form>
</div>

<script>
    const jamTayangList = [
        <% for (Film f : filmList) { %>
            ["<%= String.join("\", \"", f.jamTayang) %>"],
        <% } %>
    ];

    function updateJamTayang() {
        const filmIndex = document.getElementById("filmSelect").value;
        const jamSelect = document.getElementById("jamSelect");
        jamSelect.innerHTML = "";

        jamTayangList[filmIndex].forEach(jam => {
            const option = document.createElement("option");
            option.value = jam;
            option.textContent = jam;
            jamSelect.appendChild(option);
        });
    }

    window.onload = updateJamTayang;
</script>
</body>
</html>
