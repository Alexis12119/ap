const passwords = {
  baitang7: "b7pass",
  baitang8: "b8pass",
  baitang9: "b9pass",
  baitang10: "b10pass",
};

function enterPassword(grade) {
  const input = prompt("Ilagay ang password para sa " + grade.toUpperCase());

  if (input === null) {
    // User pressed Cancel, just exit
    return;
  }

  if (input === passwords[grade]) {
    // Set sessionStorage if it's not set already (or refresh it)
    const userRole = sessionStorage.getItem("userRole");
    const userEmail = sessionStorage.getItem("userEmail");

    if (!userRole || !userEmail) {
      alert("Please log in first.");
      window.location.href = "index.html";  // Redirect to login if session is missing
      return;
    }

    // Everything is okay, redirect to the lessons page
    window.location.href = `lessons/${grade}.html`;
  } else if (input === "") {
    alert("Wala ka pang inilalagay na password.");
    enterPassword(grade);
  } else {
    alert("Maling password. Subukang muli.");
    enterPassword(grade);
  }
}
