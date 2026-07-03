/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // Landing page ships static imagery; skip the optimizer so it builds and runs
  // anywhere (including plain `next start`) without a sharp dependency.
  images: { unoptimized: true },
};

export default nextConfig;
