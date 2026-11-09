const https = require('https');
const fs = require('fs');

async function searchYt(q) {
  return new Promise((resolve) => {
    https.get('https://www.youtube.com/results?search_query=' + encodeURIComponent(q), (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        const ids = [];
        const re = /\/watch\?v=([a-zA-Z0-9_-]{11})/g;
        let m;
        while ((m = re.exec(data)) !== null) {
          if (!ids.includes(m[1])) ids.push(m[1]);
        }
        resolve(ids.slice(0, 5));
      });
    }).on('error', () => resolve([]));
  });
}

async function verifyId(id) {
  return new Promise((resolve) => {
    https.get('https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=' + id + '&format=json', (res) => {
      let b = '';
      res.on('data', chunk => b += chunk);
      res.on('end', () => {
        let title = '';
        try { title = JSON.parse(b).title; } catch {}
        resolve({ status: res.statusCode, title });
      });
    }).on('error', () => resolve({ status: 500, title: '' }));
  });
}

const list = [
  // BOLERO & TRỮ TÌNH
  { title: "Sầu Tím Thiệp Hồng", artist: "Quang Lê & Lệ Quyên", query: "Sau Tim Thiep Hong Quang Le Le Quyen", distractors: ["Duyên Phận", "Con Đường Xưa Em Đi", "Vùng Lá Me Bay"], startTime: 15 },
  { title: "Duyên Phận", artist: "Như Quỳnh", query: "Duyen Phan Nhu Quynh PBN", distractors: ["Sầu Tím Thiệp Hồng", "Đoạn Tuyệt", "Nỗi Buồn Hoa Phượng"], startTime: 20 },
  { title: "Vùng Lá Me Bay", artist: "Như Quỳnh", query: "Vung La Me Bay Nhu Quynh", distractors: ["Con Đường Xưa Em Đi", "Duyên Phận", "Hoa Nở Về Đêm"], startTime: 18 },
  { title: "Con Đường Xưa Em Đi", artist: "Như Quỳnh", query: "Con Duong Xua Em Di Nhu Quynh", distractors: ["Vùng Lá Me Bay", "Sầu Tím Thiệp Hồng", "Chuyến Tàu Hoàng Hôn"], startTime: 15 },
  { title: "Áo Mới Cà Mau", artist: "Phi Nhung", query: "Ao Moi Ca Mau Phi Nhung", distractors: ["Đêm Gành Hào Nghe Điệu Hoài Lang", "Phải Lòng Con Gái Bến Tre", "Bông Điên Điển"], startTime: 15 },
  { title: "Biển Tình", artist: "Đàm Vĩnh Hưng", query: "Bien Tinh Dam Vinh Hung", distractors: ["Say Tình", "Lâu Đài Tình Ái", "Xin Lỗi Tình Yêu"], startTime: 15 },
  { title: "Đêm Gành Hào Nghe Điệu Hoài Lang", artist: "Cẩm Ly", query: "Dem Ganh Hao Nghe Dieu Hoai Lang Cam Ly", distractors: ["Áo Mới Cà Mau", "Vọng Cổ Buồn", "Nỗi Buồn Mẹ Tôi"], startTime: 20 },
  { title: "Nỗi Buồn Hoa Phượng", artist: "Phi Nhung", query: "Noi Buon Hoa Phuong Phi Nhung", distractors: ["Lưu Bút Ngày Xanh", "Ba Tháng Tạ Từ", "Hạ Buồn"], startTime: 18 },
  { title: "Tàu Anh Qua Núi", artist: "NSND Thanh Hoa", query: "Tau Anh Qua Nui Thanh Hoa", distractors: ["Cô Gái Mở Đường", "Chào Em Cô Gái Lam Hồng", "Bài Ca Hà Nội"], startTime: 15 },

  // NHẠC 8X - 9X THANH XUÂN
  { title: "Kiếp Ve Sầu", artist: "Đan Trường", query: "Kiep Ve Sau Dan Truong Official", distractors: ["Tình Khúc Vàng", "Đi Về Nơi Xa", "Mưa Trên Cuộc Tình"], startTime: 18 },
  { title: "Tình Khúc Vàng", artist: "Đan Trường", query: "Tinh Khuc Vang Dan Truong Official", distractors: ["Kiếp Ve Sầu", "Dòng Máu Lạc Hồng", "Mãi Mãi Một Tình Yêu"], startTime: 20 },
  { title: "Đi Về Nơi Xa", artist: "Đan Trường", query: "Di Ve Noi Xa Dan Truong Official", distractors: ["Kiếp Ve Sầu", "Tình Khúc Vàng", "Phong Ba Tình Đời"], startTime: 15 },
  { title: "Tình Thôi Xót Xa", artist: "Lam Trường", query: "Tinh Thoi Xot Xa Lam Truong", distractors: ["Katy Katy", "Mưa Phi Trường", "Gót Hồng"], startTime: 15 },
  { title: "Katy Katy", artist: "Lam Trường", query: "Katy Katy Lam Truong", distractors: ["Tình Thôi Xót Xa", "Tôi Là Ai Em Là Ai", "Mưa Phi Trường"], startTime: 15 },
  { title: "Chim Trắng Mồ Côi", artist: "Đan Trường & Cẩm Ly", query: "Chim Trang Mo Coi Dan Truong Cam Ly", distractors: ["Vọng Cổ Buồn", "Áo Mới Cà Mau", "Anh Ba Khía"], startTime: 20 },
  { title: "Thà Rằng Như Thế", artist: "Ưng Hoàng Phúc", query: "Tha Rang Nhu The Ung Hoang Phuc", distractors: ["Người Ta Nói", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Kỷ Niệm Bỏ Quên"], startTime: 18 },
  { title: "Người Ta Nói", artist: "Ưng Hoàng Phúc", query: "Nguoi Ta Noi Ung Hoang Phuc", distractors: ["Thà Rằng Như Thế", "Hứa Thật Nhiều Thất Hứa Thật Nhiều", "Cắn Rứt"], startTime: 15 },
  { title: "Hứa Thật Nhiều Thất Hứa Thật Nhiều", artist: "Ưng Hoàng Phúc", query: "Hua That Nhieu That Hua That Nhieu Ung Hoang Phuc", distractors: ["Thà Rằng Như Thế", "Người Ta Nói", "Vì Sao Trong Lòng Tôi"], startTime: 15 },
  { title: "Kiếp Đỏ Đen", artist: "Duy Mạnh", query: "Kiep Do Den Duy Manh", distractors: ["Hãy Về Đây Bên Anh", "Ta Đâu Có Say", "Dĩ Vãng Cuộc Tình"], startTime: 15 },
  { title: "Hãy Về Đây Bên Anh", artist: "Duy Mạnh", query: "Hay Ve Day Ben Anh Duy Manh", distractors: ["Kiếp Đỏ Đen", "Lời Xin Lỗi Của Một Dân Chơi", "Giây Phút Chia Xa"], startTime: 15 },
  { title: "Mùa Đông Không Lạnh", artist: "Akira Phan", query: "Mua Dong Khong Lanh Akira Phan", distractors: ["Lời Nguyền", "Đứng Dậy Vươn Vai", "Điều Ước Giản Đơn"], startTime: 15 },
  { title: "Đôi Mắt", artist: "WanBi Tuấn Anh", query: "Doi Mat WanBi Tuan Anh", distractors: ["Vụt Mất", "Dấu Vết", "Bắt Sóng Cảm Xúc"], startTime: 15 },
  { title: "Tìm Lại Bầu Trời", artist: "Tuấn Hưng", query: "Tim Lai Bau Troi Tuan Hung Official", distractors: ["Cầu Vồng Khuyết", "Nắm Lấy Tay Anh", "Độc Thoại"], startTime: 18 },
  { title: "Miền Cát Trắng", artist: "Quang Vinh", query: "Mien Cat Trang Quang Vinh", distractors: ["Ngôi Nhà Hoa Hồng", "Dịu Dàng Đến Từng Phút Giây", "Tình Yêu Diệu Kỳ"], startTime: 15 },
  { title: "Cô Gái Trung Hoa", artist: "Lương Bích Hữu", query: "Co Gai Trung Hoa Luong Bich Huu", distractors: ["Dằm Trong Tim", "Học Cách Đi Một Mình", "Gọi Tên Tôi Bạn Thân Hỡi"], startTime: 15 },
  { title: "Dằm Trong Tim", artist: "Lương Bích Hữu", query: "Dam Trong Tim Luong Bich Huu", distractors: ["Cô Gái Trung Hoa", "Quên Cách Yêu", "Nước Mắt Hóa Đá"], startTime: 15 },
  { title: "Ước Gì", artist: "Mỹ Tâm", query: "Uoc Gi My Tam Official", distractors: ["Họa Mi Tóc Nâu", "Người Hãy Quên Em Đi", "Cây Đàn Sinh Viên"], startTime: 15 },

  // NHẠC TRẺ HIỆN ĐẠI & VIRAL V-POP
  { title: "Ngủ Một Mình", artist: "HIEUTHUHAI ft. Negav", query: "Ngu Mot Minh HIEUTHUHAI MV", distractors: ["Cua", "Vệ Tinh", "NOLOVE NOLIFE"], startTime: 15 },
  { title: "Cua", artist: "HIEUTHUHAI", query: "CUA HIEUTHUHAI MV", distractors: ["Ngủ Một Mình", "Bật Nhạc Lên", "Lời Đường Mật"], startTime: 15 },
  { title: "Vũ Trụ Có Anh", artist: "Phương Mỹ Chi ft. Pháo", query: "Vu Tru Co Anh Phuong My Chi MV", distractors: ["Bóng Phù Hoa", "Đẩy Xe Bò", "Chiếc Lược Ngà"], startTime: 15 },
  { title: "Bóng Phù Hoa", artist: "Phương Mỹ Chi", query: "Bong Phu Hoa Phuong My Chi", distractors: ["Vũ Trụ Có Anh", "Hai Đứa Trẻ", "Những Ngôi Sao Xa Xôi"], startTime: 15 },
  { title: "Bước Qua Nhau", artist: "Vũ.", query: "Buoc Qua Nhau Vu Official MV", distractors: ["Lạ Lùng", "Bước Qua Mùa Cô Đơn", "Đông Kiếm Em"], startTime: 15 },
  { title: "Bước Qua Mùa Cô Đơn", artist: "Vũ.", query: "Buoc Qua Mua Co Don Vu MV", distractors: ["Lạ Lùng", "Bước Qua Nhau", "Lời Yêu Em"], startTime: 15 },
  { title: "Từng Quen", artist: "Wren Evans", query: "Tung Quen Wren Evans", distractors: ["Thích Em Hơi Nhiều", "Cơn Đau Tốt Với Tôi", "Bé Ơi Từ Từ"], startTime: 15 },
  { title: "Thích Em Hơi Nhiều", artist: "Wren Evans", query: "Thich Em Hoi Nhieu Wren Evans MV", distractors: ["Từng Quen", "Gặp May", "Vùng Trời Bình Yên"], startTime: 15 },
  { title: "Nếu Lúc Đó", artist: "tlinh ft. 2pillz", query: "Neu Luc Do tlinh MV", distractors: ["Gái Độc Thân", "Thích Quá Rùi Nà", "Ghê Sợ"], startTime: 15 },
  { title: "vaicaunoicokhiennguoithaydoi", artist: "GREY D ft. tlinh", query: "vaicaunoicokhiennguoithaydoi GREY D tlinh MV", distractors: ["đưa em về nhà", "dự báo thời tiết hôm nay mưa", "tình vỗ cánh bay"], startTime: 15 },
  { title: "À Lôi", artist: "Double2T ft. Masew", query: "A Loi Double2T Masew MV", distractors: ["Người Miền Núi Chất", "Theo Anh Về Bản", "Chài Điếp Noọng"], startTime: 15 },
  { title: "Thằng Điên", artist: "JustaTee ft. Phương Ly", query: "Thang Dien JustaTee Phuong Ly MV", distractors: ["Mặt Trời Của Em", "Forever Alone", "Đã Lỡ Yêu Em Nhiều"], startTime: 15 },
  { title: "Đoạn Kết Mới", artist: "Hoàng Dũng", query: "Doan Ket Moi Hoang Dung MV", distractors: ["Nàng Thơ", "Nép Vào Anh Và Nghe Anh Hát", "Đôi Mươi"], startTime: 15 },
  { title: "Giá Như", artist: "SOOBIN", query: "Gia Nhu SOOBIN MV", distractors: ["Phía Sau Một Cô Gái", "Đi Để Trở Về", "BlackJack"], startTime: 15 }
];

(async () => {
  const verified = [];
  for (const item of list) {
    const ids = await searchYt(item.query);
    let found = false;
    if (ids.length > 0) {
      for (const id of ids) {
        const res = await verifyId(id);
        if (res.status === 200) {
          verified.push({
            ...item,
            ytid: id,
            ytTitle: res.title
          });
          console.log('SUCCESS:', item.title, '->', id, '|', res.title);
          found = true;
          break;
        }
      }
    }
    if (!found) {
      console.log('FAIL:', item.title);
    }
  }

  fs.writeFileSync('./scripts/verified_new_songs.json', JSON.stringify(verified, null, 2), 'utf8');
  console.log('Total verified new songs:', verified.length);
})();
