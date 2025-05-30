# Chọn Node 20
FROM node:20

# Cài thêm các dependency (n8n cần Python + build tools)
RUN apt-get update && apt-get install -y python3 make g++ git

# Tạo thư mục làm việc
WORKDIR /app

# Clone code n8n từ chính repo bạn fork (hoặc copy từ build context)
COPY . .

# Cài n8n + build
RUN npm install
RUN npm run build

# Cổng mặc định
EXPOSE 5678

# Chạy n8n
CMD ["npx", "n8n"]
