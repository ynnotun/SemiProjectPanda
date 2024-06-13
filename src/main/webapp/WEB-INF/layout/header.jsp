<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
 <style>
     /* search input https://codepen.io/sdaitzman/pen/bGbgPm */
     .search-box {
         transition: width 0.6s, border-radius 0.6s, background 0.6s, box-shadow 0.6s;
         width: 40px;
         height: 40px;
         border-radius: 20px;
         border: none;
         cursor: pointer;
         background: black;
     }
     .search-box + label .search-icon {
         color: black;
     }
     .search-box:hover {
         color: white;
         background: #c8c8c8;
         box-shadow: 0 0 0 5px #3d4752;
     }
     .search-box:hover + label .search-icon {
         color: white;
     }
     .search-box:focus {
         transition: width 0.6s, border-radius 0.6s, background 0.6s;
         border: none;
         outline: none;
         box-shadow: none;
         padding-left: 15px;
         cursor: text;
         width: 300px;
         border-radius: auto;
         background: #ebebeb;
         color: black;
     }
     .search-box:focus + label .search-icon {
         color: black !important;
     }
     .search-box:not(:focus) {
         text-indent: -5000px;
     }

     #search-submit {
         position: relative;
         left: -5000px;
     }

     .search-icon {
         position: relative;
         left: -34px;
         top: 1px;
         color: white;
         cursor: pointer;
     }
     .search-container {

     }
 </style>
<html>
<body>
<!--
// v0 by Vercel.
// https://v0.dev/t/dlq5R4mPoUj
-->

<div class="flex flex-col">
    <header class="bg-black text-white py-1 px-6 md:px-8 flex items-center justify-between">
        <a class="flex items-center gap-2" href="#">
            <img src="../image/logo.png" alt="">
        </a>

        <nav class="hidden md:flex items-center gap-6">
            <form class="search-container" action="">
                <input id="search-box" type="text" class="search-box" name="q" />
                <label for="search-box">
                    <span class="glyphicon glyphicon-search search-icon text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                        </svg>
                    </span>
                </label>
                <input type="submit" id="search-submit" />
            </form>
            <a class="flex items-center gap-2 hover:text-gray-200" href="#">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="w-5 h-5"
                >
                    <path d="M5 12h14"></path>
                    <path d="M12 5v14"></path>
                </svg>
                <span>Sell</span>
            </a>
            <a class="flex items-center gap-2 hover:text-gray-200" href="#">
                <img
                        src="/placeholder.svg"
                        width="32"
                        height="32"
                        class="rounded-full"
                        alt="Profile"
                        style="aspect-ratio: 32 / 32; object-fit: cover;"
                />
                <span>Profile</span>
            </a>
        </nav>
        <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10 md:hidden">
            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="w-6 h-6"
            >
                <line x1="4" x2="20" y1="12" y2="12"></line>
                <line x1="4" x2="20" y1="6" y2="6"></line>
                <line x1="4" x2="20" y1="18" y2="18"></line>
            </svg>
            <span class="sr-only">Toggle menu</span>
        </button>
    </header>
</div>
</body>
</html>
