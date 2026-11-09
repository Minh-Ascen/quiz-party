const https = require('https');

async function searchYt(q) {
  return new Promise((resolve) => {
    https.get('https://www.youtube.com/results?search_query=' + encodeURIComponent(q), (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        const matches = data.match(/"videoId":"([a-zA-Z0-9_-]{11})"/g);
        if (matches) {
          const ids = matches.map(m => m.split('"')[3]);
          const uniqueIds = Array.from(new Set(ids));
          resolve(uniqueIds.slice(0, 3));
        } else {
          resolve([]);
        }
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

(async () => {
  const queries = [
    'Lạ Lùng Vũ Official Audio',
    'Lạ Lùng Vũ Live Lululola',
    'Lạ Lùng Vũ Soul of the Forest'
  ];

  for (const q of queries) {
    const ids = await searchYt(q);
    if (ids.length > 0) {
      for (const id of ids) {
        const res = await verifyId(id);
        if (res.status === 200) {
          console.log('SUCCESS:', q, '->', id, '|', res.title);
          break;
        }
      }
    }
  }
})();
