import React from 'react';

const cardStyle: React.CSSProperties = {
  background: '#fff',
  borderRadius: 18,
  padding: 20,
  boxShadow: '0 8px 30px rgba(15,23,42,0.07)',
};

export function AdminApp() {
  return (
    <main style={{ padding: 24, fontFamily: 'Inter, system-ui', background: '#f8fafc', minHeight: '100vh' }}>
      <h1 style={{ marginBottom: 20 }}>Vadakara Connect Admin</h1>
      <section style={{ display: 'grid', gap: 16, gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))' }}>
        <article style={cardStyle}><h3>Users</h3><p>0</p></article>
        <article style={cardStyle}><h3>Pending Providers</h3><p>0</p></article>
        <article style={cardStyle}><h3>Open Complaints</h3><p>0</p></article>
        <article style={cardStyle}><h3>Audit Events</h3><p>0</p></article>
      </section>
    </main>
  );
}
