<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Form Absen Staff BEM FTIf</title>
<style>
  // More practical CSS...
// using mobile first method (IE8,7 requires respond.js polyfill https://github.com/scottjehl/Respond)

$breakpoint-alpha: 480px; // adjust to your needs

.rwd-table {
  margin: 1em 0;
  min-width: 300px; // adjust to your needs
  
  tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
  }
  
  th {
    display: none; // for accessibility, use a visually hidden method here instead! Thanks, reddit!   
  }
  
  td {
    display: block; 
    
    &:first-child {
      padding-top: .5em;
    }
    &:last-child {
      padding-bottom: .5em;
    }

    &:before {
      content: attr(data-th)": "; // who knew you could do this? The internet, that's who.
      font-weight: bold;

      // optional stuff to make it look nicer
      width: 6.5em; // magic number :( adjust according to your own content
      display: inline-block;
      // end options
      
      @media (min-width: $breakpoint-alpha) {
        display: none;
      }
    }
  }
  
  th, td {
    text-align: left;
    
    @media (min-width: $breakpoint-alpha) {
      display: table-cell;
      padding: .25em .5em;
      
      &:first-child {
        padding-left: 0;
      }
      
      &:last-child {
        padding-right: 0;
      }
    }

  }
  
  
}


// presentational styling

@import 'http://fonts.googleapis.com/css?family=Montserrat:300,400,700';

body {
  padding: 0 2em;
  font-family: Montserrat, sans-serif;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  color: #444;
  background: #eee;
}

h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
  tr {
    border-color: lighten(#34495E, 10%);
  }
  th, td {
    margin: .5em 1em;
    @media (min-width: $breakpoint-alpha) { 
      padding: 1em !important; 
    }
  }
  th, td:before {
    color: #dd5;
  }
}
  
</style>
</head>

<body>
<h1>RWD List to Table</h1>
<table class="rwd-table">
  <tr>
    <th>Movie Title</th>
    <th>Genre</th>
    <th>Year</th>
    <th>Gross</th>
  </tr>
  <tr>
    <td data-th="Movie Title">Star Wars</td>
    <td data-th="Genre">Adventure, Sci-fi</td>
    <td data-th="Year">1977</td>
    <td data-th="Gross">$460,935,665</td>
  </tr>
  <tr>
    <td data-th="Movie Title">Howard The Duck</td>
    <td data-th="Genre">"Comedy"</td>
    <td data-th="Year">1986</td>
    <td data-th="Gross">$16,295,774</td>
  </tr>
  <tr>
    <td data-th="Movie Title">American Graffiti</td>
    <td data-th="Genre">Comedy, Drama</td>
    <td data-th="Year">1973</td>
    <td data-th="Gross">$115,000,000</td>
  </tr>
</table>

<p>&larr; Drag window (in editor or full page view) to see the effect. &rarr;</p>

<script>
// Responsive table method using display:block and data attributes
// Thanks to @leefroese for suggestion about data attributes

</script>

</body>
</html>