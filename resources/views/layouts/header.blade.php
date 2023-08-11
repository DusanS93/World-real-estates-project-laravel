<header class="header">
    <div class="header-wrapp">
        <div class="logo-img">
            <a href="{{ url('/') }}">
                <img src="{{ url('/images/logo.jpg') }}" alt="logo">
            </a>
        </div>

        <nav class="navigation">
            <ul class="nav-link">
                <li><a class="links" href="/">HOME</a></li>
                @guest
                  @if (Route::has('login'))
                  <li><a class="links" href="{{ route('login') }}">LOGIN</a></li>
                  @endif
                  @if (Route::has('register'))
                  <li><a class="links" href="{{ route('register') }}">REGISTER</a></li>
                  @endif
         
                  @else
                  <li><a class="links" href="{{ url('/real-estate/create') }}">ADD NEW</a></li>
                  <li><a class="links" href="/real-estate/dashboard">{{ Auth::user()->name }} - {{ Auth::user()->role->role_name }}</a></li>
                  <li><a class="links" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">LOGOUT</a></li>

                  <form id="logout-form" action="{{ route('logout') }}" method="POST">
                        @csrf
                  </form>
                @endguest
            </ul>
        </nav>
    </div>
</header>

<!-- Right Side Of Navbar -->
    <!-- <ul class="navbar-nav ms-auto"> -->
        <!-- Authentication Links -->
        <!-- @guest
            @if (Route::has('login'))
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                </li>
            @endif

            @if (Route::has('register'))
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                </li>
            @endif
        @else
            <li class="nav-item dropdown">
                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                    {{ Auth::user()->name }}
                </a>

                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                        {{ __('Logout') }}
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </div>
            </li>
        @endguest
    </ul> -->
                
            
