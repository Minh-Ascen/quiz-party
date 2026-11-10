const https = require('https');

async function testId(title, artist, ytid) {
  return new Promise((resolve) => {
    https.get('https://noembed.com/embed?url=https://www.youtube.com/watch?v=' + ytid, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          if (json.title && !json.error) {
            resolve({ title, artist, ytid, ok: true, ytTitle: json.title });
          } else {
            resolve({ title, artist, ytid, ok: false });
          }
        } catch(e) {
          resolve({ title, artist, ytid, ok: false });
        }
      });
    }).on('error', () => resolve({ title, artist, ytid, ok: false }));
  });
}

module.exports = { testId };

