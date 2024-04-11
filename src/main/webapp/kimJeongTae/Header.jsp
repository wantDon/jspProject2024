<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피트니스</title>
    <style>
        header {
            background-color: #ffffff; /* ë¤ë¹ê²ì´ì ë° ë°°ê²½ì */
            padding: 20px 0; /* ìë¨ ì¬ë°±ê³¼ íë¨ ì¬ë°± */
        }

        nav {
            display: flex;
            justify-content: space-between; /* ìì ì¬ì´ì ì¬ë°±ì ìµëííì¬ ììë¥¼ ì ë ¬ */
            align-items: center; /* ì¸ë¡ ë°©í¥ì¼ë¡ ììë¤ì ì¤ì ì ë ¬ */
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center; /* ì¸ë¡ ë°©í¥ì¼ë¡ ììë¤ì ì¤ì ì ë ¬ */
        }	

        nav ul li {
            margin:	0 50px; /* ê° ë©ë´ ìì´í ì¬ì´ì ì¬ë°± ì¡°ì  */
        }

        nav ul li a {
            text-decoration: none;
            color: #333; /* ë©ë´ íì¤í¸ ìì */
            font-size: 25px; /* ê¸ì í¬ê¸° ì¤ì  */
            font-weight: bold; /* êµµì ê¸ê¼´ ì¤ì  */
        }

        .login a {
            background-color: #8B4513; /* ë¡ê·¸ì¸ ë²í¼ ë°°ê²½ì (ê°ì) */
            color: #fff; /* ë¡ê·¸ì¸ ë²í¼ íì¤í¸ ìì */
            padding: 10px 20px; /* ë©ë´ ê°ê²© */
            border-radius: 5px; /* ë²í¼ ëª¨ìë¦¬ ë¥ê¸ê² */
            text-decoration: none;
            margin-right: 150px; /* ì¤ë¥¸ìª½ ì¬ë°± ì¶ê° */
            font-weight: normal;
        }

        .login a:hover {
            color: #4C4B4B; /* ë§ì°ì¤ ì¤ë² ì íì¤í¸ ìì */
        }

        .logo img {
            width: 350px; /* ë¡ê³  ì´ë¯¸ì§ ëë¹ ì¤ì  */
            height: auto; /* ëì´ ìëì¼ë¡ ì¡°ì  */
            margin-left: 130px; /* ì¼ìª½ ì¬ë°± ì¶ê° */
            cursor: pointer; /* í´ë¦­ ê°ë¥í ì»¤ì ì¤ì  */
        }

        .navbar-toggle {
		    display: none; /* ìì íë©´ììë§ íë²ê±° ìì´ì½ì ë³´ì´ëë¡ í©ëë¤. */
		    border: none; /* íëë¦¬ë¥¼ ìì±ëë¤. */
		    font-size: 30px; /* ìì´ì½ì í¬ê¸°ë¥¼ í¤ìëë¤. */
		    background: none; /* ë°°ê²½ì ìì±ëë¤. */
		    cursor: pointer;
		}
		
		.close-btn {
        	display: none; /* ì´ê¸°ìë ë«ê¸° ë²í¼ì ì¨ê¹ëë¤. */
            position: absolute;
            top: 50px;
            right: 30px;
            font-size: 24px;
            cursor: pointer;
        }

        /* ìì íë©´ììë§ íë²ê±° ìì´ì½ì ë³´ì´ëë¡ ì¤ì í©ëë¤. */
        @media screen and (max-width: 768px) {
            .menu-collapse {
                position: fixed;
                top: 0;
                right: -100%; /* ì´ê¸°ìë íë©´ ì¤ë¥¸ìª½ì ë³´ì´ì§ ììµëë¤. */
                width: 50%;
                height: 100vh;
                background-color: #f9f9f9;
                padding: 40px;
                box-shadow: -4px 0 8px rgba(0, 0, 0, 0.1);
                transition: right 0.3s ease-in-out; /* í¸ëì§ì í¨ê³¼ë¥¼ ì¶ê°íì¬ ë¶ëë¬ì´ ì´ë í¨ê³¼ë¥¼ ë§ë­ëë¤. */
            }

            .menu-collapse.show {
                right: 0; /* íë²ê±° ìì´ì½ì í´ë¦­íì ë ë©ë´ê° íë©´ ì¤ë¥¸ìª½ìì ëíë©ëë¤. */
            }

            .menu-collapse ul {
            	flex-direction: column; /* ë©ë´ ìì´íì ì¸ë¡ë¡ ì ë ¬í©ëë¤. */
            	align-items: flex-start; /* ë©ë´ ìì´íì ì¼ìª½ì¼ë¡ ì ë ¬í©ëë¤. */
                list-style-type: none;
                padding: 0;
            }

            .menu-collapse li {
                margin: 10px 0;
            }

            .navbar-toggle {
                display: block; /* ìì íë©´ììë§ íë²ê±° ìì´ì½ì ë³´ì´ëë¡ í©ëë¤. */
            }
            
            .menu-collapse.show .close-btn {
                display: block; /* ë©ë´ê° í¼ì³ì§ ë ë«ê¸° ë²í¼ì ë³´ì´ëë¡ í©ëë¤. */
            }
            
            .menu-collapse .login a {
                background-color: transparent;
                color: #333;
                font-weight: bold;
                padding: 10px 0;
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo" onclick="window.location.href='HomePage.jsp'">
                <img src="img/logo.png" alt="ë¡ê³  ì´ë¯¸ì§">
            </div>
            <button class="navbar-toggle">&#9776;</button>
            <div class="menu-collapse">
                <button class="close-btn">&times;</button>
                <ul>
                    <li><a href="ProgramPage.jsp">Program</a></li>
                    <li><a href="#">Reservation</a></li>
                    <li><a href="#">Membership</a></li>
                    <li><a href="#">Review</a></li>
                    <li><a href="#">Q&A</a></li>
                    <li class="login">
                     	   <a href="#">Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <script>
	    document.querySelector('.navbar-toggle').addEventListener('click', function () {
	        document.querySelector('.menu-collapse').classList.toggle('show');
	        // ë©ë´ë°ê° íìë  ë z-indexë¥¼ ëì¬ ë¤ë¥¸ ìì ìì ê¹ë¦¬ëë¡ ì¤ì í©ëë¤.
	        document.querySelector('.menu-collapse').style.zIndex = '999';
	    });
	
	    document.querySelector('.close-btn').addEventListener('click', function () {
	        document.querySelector('.menu-collapse').classList.remove('show');
	        // ë©ë´ë°ê° ë«í ë z-indexë¥¼ ì´ê¸°ê°ì¼ë¡ ì¤ì íì¬ ë¤ë¥¸ ìì ìì ê°ë ¤ì§ì§ ìëë¡ í©ëë¤.
	        document.querySelector('.menu-collapse').style.zIndex = '1';
	    });
	</script>
</body>
</html>
