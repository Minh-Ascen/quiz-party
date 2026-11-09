const https = require('https');

async function searchFirstVideo(q) {
  return new Promise((resolve) => {
    https.get('https://www.youtube.com/results?search_query=' + encodeURIComponent(q), (res) => {
      let b = ''; res.on('data', c => b += c);
      res.on('end', () => {
        const re = /\/watch\?v=([a-zA-Z0-9_-]{11})/g;
        let m;
        const ids = [];
        while ((m = re.exec(b)) !== null) {
          if (!ids.includes(m[1])) ids.push(m[1]);
        }
        resolve(ids.slice(0, 5));
      });
    }).on('error', () => resolve([]));
  });
}

async function verify(id) {
  return new Promise(r => {
    https.get('https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=' + id + '&format=json', res => {
      let b = ''; res.on('data', c => b += c);
      res.on('end', () => {
        let t = ''; try { t = JSON.parse(b).title; } catch {}
        r({ status: res.statusCode, title: t });
      });
    }).on('error', () => r({ status: 500 }));
  });
}

(async () => {
  const songs = [
    { title: "Katy Katy", q: "KATY KATY LAM TRUONG" },
    { title: "Vọng Cổ Buồn", q: "VONG CO BUON CAM LY" },
    { title: "Nỗi Buồn Hoa Phượng", q: "NOI BUON HOA PHUONG PHI NHUNG" },
    { title: "Hoa Nở Về Đêm", q: "HOA NO VE DEM LE QUYEN" },
    { title: "Gạt Đi Nước Mắt", q: "GAT DI NUOC MAT NOO PHUOC THINH" },
    { title: "Dòng Máu Lạc Hồng", q: "DONG MAU LAC HONG DAN TRUONG" },
    { title: "Mưa Phi Trường", q: "MUA PHI TRUONG LAM TRUONG" },
    { title: "Căn Nhà Màu Tím", q: "CAN NHA MAU TIM QUANG LE" },
    { title: "Hoa Trinh Nữ", q: "HOA TRINH NU NHU QUYNH" },
    { title: "Chuyện Hoa Sim", q: "CHUYEN HOA SIM NHU QUYNH" }
  ];

  for (const s of songs) {
    const ids = await searchFirstVideo(s.q);
    for (const id of ids) {
      const v = await verify(id);
      if (v.status === 200) {
        console.log('SUCCESS:', s.title, '->', id, '|', v.title);
        break;
      }
    }
  }
})();
