const title = document.querySelector("#eduwork h1");
const work = document.getElementById("work");
const education = document.getElementById("education");

document.querySelectorAll('#eduwork [role="tab"]').forEach((btn) => {
	btn.addEventListener("click", () => {
		document.querySelectorAll('#eduwork [role="tab"]').forEach((b) => {
			b.setAttribute("aria-selected", b === btn);
		});
	});
});

document.getElementById("work-button").addEventListener("click", () => {
	title.textContent = "Work";
	work.setAttribute("aria-hidden", false);
	education.setAttribute("aria-hidden", true);
});

document.getElementById("education-button").addEventListener("click", () => {
	title.textContent = "Education";
	work.setAttribute("aria-hidden", true);
	education.setAttribute("aria-hidden", false);
});
