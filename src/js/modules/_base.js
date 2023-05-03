// ==========================================================================
// Base
// ==========================================================================

// Using Strict Mode
"use strict";

// Prevent # anchors jumping page to top
$('a[href="#"]').on('click', function (e) {
    e.preventDefault();
});

/*
if (typeof DEVELOPMENT !== "undefined" && DEVELOPMENT) {
    $("body").addClass("debug");
}
*/