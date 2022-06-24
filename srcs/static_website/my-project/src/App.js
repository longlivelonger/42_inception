import './App.css';
import { Navbar, Carousel, Button, Spinner } from 'flowbite-react';

function App() {
  return (
    <div>
      <Navbar
        fluid={true}
        rounded={true}
      >
        <Navbar.Brand href="http://sbronwyn.42.fr/">
          <span className="self-center whitespace-nowrap text-xl font-semibold dark:text-white">
            Sbronwyn Test React
          </span>
        </Navbar.Brand>
        <Navbar.Toggle />
        <Navbar.Collapse>
          <Navbar.Link
            href="/navbars"
            active={true}
          >
            Home
          </Navbar.Link>
          <Navbar.Link href="/navbars">
            About
          </Navbar.Link>
          <Navbar.Link href="/navbars">
            Services
          </Navbar.Link>
          <Navbar.Link href="/navbars">
            Pricing
          </Navbar.Link>
          <Navbar.Link href="/navbars">
            Contact
          </Navbar.Link>
        </Navbar.Collapse>
      </Navbar>

      <div className="h-56 sm:h-64 xl:h-80 2xl:h-96 m-10">
        <Carousel slideInterval={5000}>
          <img
            src="https://flowbite.com/docs/images/carousel/carousel-1.svg"
            alt="..."
          />
          <img
            src="https://flowbite.com/docs/images/carousel/carousel-2.svg"
            alt="..."
          />
          <img
            src="https://flowbite.com/docs/images/carousel/carousel-3.svg"
            alt="..."
          />
          <img
            src="https://flowbite.com/docs/images/carousel/carousel-4.svg"
            alt="..."
          />
          <img
            src="https://flowbite.com/docs/images/carousel/carousel-5.svg"
            alt="..."
          />
        </Carousel>
        <div className="mt-10">
          <Button >
            <Spinner aria-label="Spinner button example" />
            <span className="pl-3">
              Loading...
            </span>
          </Button>
        </div>
      </div>

    </div>
  );
}

export default App;
