import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router } from "react-router-dom";

var Main = require('./../output/Main/index.js');

function main() {
    const myComponent = (
        <Router>
            <Main.app />
        </Router>
    );

    ReactDOM.render(myComponent, document.getElementById('root'));
}

if (module.hot) {
    module.hot.accept(function () {
        console.log('running main again');
        main();
    });
}

main();