const https = require('https');

function searchYouTube(query) {
  return new Promise((resolve) => {
    const url = 'https://www.youtube.com/results?search_query=' + encodeURIComponent(query);
    const req = https.get(url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept-Language': 'vi,en;q=0.9'
      }
    }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        const regex = /"videoId":"([a-zA-Z0-9_-]{11})"/g;
        const ids = [];
        let m;
        while ((m = regex.exec(data)) !== null) {
          if (!ids.includes(m[1])) {
            ids.push(m[1]);
          }
        }
        resolve(ids.slice(0, 5));
      });
    });
    req.on('error', () => resolve([]));
  });
}

function verifyNoembed(ytid) {
  return new Promise((resolve) => {
    https.get('https://noembed.com/embed?url=https://www.youtube.com/watch?v=' + ytid, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const j = JSON.parse(data);
          if (j.title && !j.error) {
            resolve({ ok: true, title: j.title });
          } else {
            resolve({ ok: false });
          }
        } catch (e) {
          resolve({ ok: false });
        }
      });
    }).on('error', () => resolve({ ok: false }));
  });
}

async function findBestVideo(query) {
  const ids = await searchYouTube(query);
  for (const id of ids) {
    const ver = await verifyNoembed(id);
    if (ver.ok) {
      return { id, title: ver.title };
    }
  }
  return null;
}

module.exports = { searchYouTube, verifyNoembed, findBestVideo };

if (require.main === module) {
  (async () => {
    console.log('Testing findBestVideo...');
    const t1 = await findBestVideo('HIEUTHUHAI Cua official');
    console.log('HIEUTHUHAI Cua:', t1);
    const t2 = await findBestVideo('Dương Domic Tràn Bộ Nhớ official');
    console.log('Tràn Bộ Nhớ:', t2);
    const t3 = await findBestVideo('Wren Evans Thích Em Hơi Nhiều');
    console.log('Thích Em Hơi Nhiều:', t3);
  })();
}
