<h1 align="center">
  <a href="https://github.com/kajetansw/purescript-react-vite-starter">
    <img src="docs/images/purescript-logo.png" alt="PureScript logo" height="185">
    <img src="docs/images/react-logo.png" alt="React logo" height="185">
    <img src="docs/images/vite-logo.png" alt="Vite logo" height="185">
  </a>
</h1>

<div align="center">
<br />

[![Project license](https://img.shields.io/github/license/kajetansw/purescript-react-vite-starter.svg?style=flat-square)](LICENSE)

[![code with love by GITHUB_USERNAME](https://img.shields.io/badge/%3C%2F%3E%20with%20%E2%99%A5%20by-kajetansw-ff1414.svg?style=flat-square)](https://github.com/kajetansw)

</div>

<details open="open">
<summary>Table of Contents</summary>

- [About](#about)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Support](#support)
- [Project assistance](#project-assistance)
- [Authors & contributors](#authors--contributors)
- [License](#license)

</details>

---

## About

This is a starter project for everyone who'd like to start with PureScript with React and Vite as 
a tool for your dev server and build. 

This solution enables swift development with PureScript + React by having e.g. 
[Hot Module Replacement](https://vitejs.dev/guide/features.html#hot-module-replacement) enabled
and fast pre-bundling with esbuild. More about that can be found [here](https://vitejs.dev/guide/why.html).

The project is also set up so that any changes to PureScript `.purs` files will trigger changes
to the Vite server during development.


### Built With

- [PureScript](https://www.purescript.org/)
- [Spago](https://github.com/purescript/spago)
- [purs-tidy](https://github.com/purescript/spago)
- [React](https://reactjs.org/)
- [Vite](https://vitejs.dev/)
- [PostCSS](https://postcss.org/)

### Why PostCSS

This project was initially set up with PostCSS to have something similar to CSS imports in JSX or 
[CSS Modules](https://create-react-app.dev/docs/adding-a-css-modules-stylesheet/) 
in React (each component having its own CSS file), as its impossible to do something like `import "./style.css"`
in a PureScript module.

If you think it's not a solution for you, and you'd like to replace it with e.g. [`purescript-react-basic-emotion`](https://github.com/lumihq/purescript-react-basic-emotion),
it's fairly easy to do so!

To do that you'd have to:
- delete `autoprefixer`, `postcss` and `postcss-nesting` packages
- remove all `.pcss` files
- delete `postcss.config.js` file

## Getting Started

### Prerequisites

- [NodeJS and npm](https://nodejs.org/en/download/) installed
- Code editor and PureScript plugin installed. Follow [this document](https://discourse.purescript.org/t/recommended-tooling-for-purescript-in-2020/1615#editor-support-4)
to set up your IDE with necessary .

### Installation

First run the command below to clone your repo in any directory you desire:
```shell
git clone https://github.com/kajetansw/purescript-react-vite-starter
```

Then run the command below in your terminal to install all npm dependencies:
```shell
npm i
```

Run the command below to install all Spago dependencies:
```shell
npm run build:spago
```

## Usage

### Running dev server

Run the command below to start Vite dev server:
```shell
npm run start
```

Open a separate terminal and run the command below start Spago build with a `--watch` mode:
```shell
npm run start:spago
```

This setup will enable HMR changes to the Vite server during development.

### Development

You can develop more on top this starter, as with any other project based of the `purescript-react-basic`.

As there is a custom solution for CSS set up simulating CSS imports in JSX files, just have one
additional thing in mind. Any new stylesheet for your components must be manually added to the imports
in the main CSS file - `src/index.css`. Yes, this means that stylesheets are not scoped to the
component level, so it's recommended to have some naming convention for CSS classes in mind.


### Code formatting

Run the command below to format all `.purs` files in the `/src` directory using 
[purs-tidy](https://github.com/purescript/spago).
```shell
npm run format
```


## Support

In case of any problems, reach out to the maintainer via 
[GitHub issues](https://github.com/kajetansw/REPO_SLUG/issues/new).


## Project assistance

If you want to say **thank you** or/and support active development of `purescript-react-vite-starter`:

- Add a [GitHub Star](https://github.com/kajetansw/purescript-react-vite-starter) to the project.
- Tweet about the `purescript-react-vite-starter`.
- Mention it on the [official PureScript Discord server](https://purescript.org/chat).


## Authors & contributors

The original setup of this repository is by [kajetansw](https://github.com/kajetansw).


## License

This project is licensed under the **MIT license**.

See [LICENSE](LICENSE) for more information.

