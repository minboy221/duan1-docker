Giới thiệu
Đây là dự án website được xây dựng bằng PHP theo mô hình MVC, sử dụng MySQL làm cơ sở dữ liệu và được container hóa bằng Docker để dễ dàng chạy trên mọi máy.
Project được cấu hình để chỉ cần chạy một lệnh là có thể khởi động toàn bộ hệ thống (web + database).
Công nghệ sử dụng: HTML, CSS, JavaScript, PHP (MVC Architecture), MySQL, Docker & Docker Compose, Git
Yêu cầu trước khi chạy
Cài đặt:
Docker Desktop
Sau khi cài xong hãy mở Docker lên trước khi chạy project.
Cách chạy project
1. Clone project
git clone https://github.com/minboy221/duan1-docker.git
cd ten-project
2. Chạy Docker
docker compose up -d
3. Mở website
Truy cập trình duyệt:
http://localhost:8081
Database
Database sẽ được tự động import từ file:
database.sql
khi Docker chạy lần đầu.
Nếu cần reset database:
docker compose down -v
docker compose up -d --build

Tài khoản trang admin:
Email: admin
Mật Khẩu: admin123
