const passwords = {
  baitang7: "b7pass",
  baitang8: "b8pass",
  baitang9: "b9pass",
  baitang10: "b10pass"
};

function enterPassword(grade) {
  const input = prompt("Ilagay ang password para sa " + grade.toUpperCase());
  if (input === passwords[grade]) {
    window.location.href = `lessons/${grade}.html`;
  } else {
    alert("Maling password. Subukang muli.");
  }
}
