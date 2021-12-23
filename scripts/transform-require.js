const fs = require('fs');
const { viteCommonjs } = require('@originjs/vite-plugin-commonjs');

const PROD_FILE_PATH = './src/index.prod.js';

const code = fs.readFileSync(PROD_FILE_PATH, { encoding: 'utf-8' });
const transformedCode = viteCommonjs().transform(code, PROD_FILE_PATH).code;
fs.writeFileSync(PROD_FILE_PATH, transformedCode, { encoding: 'utf-8' });
