import { useEffect, useState } from 'react';

export default function App() {
  const [videoSrc, setVideoSrc] = useState('');

  useEffect(() => {
    async function loadVideo() {
      const response = await fetch('/encode64_1.json');
      const json = await response.json();

      const base64 = json[0].json.data;

      setVideoSrc(`data:video/mp4;base64,${base64}`);
    }

    loadVideo();
  }, []);

  return <div style={{ padding: 20 }}>{<video controls width="800" src={videoSrc} />}</div>;
}

