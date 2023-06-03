function CreateHTML(s) {
	let html =
	`<html style="font-family: sans-serif;"  lang="en"> 
	<body style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100vh; background: #f1fefe;">
	<form action=/Query method=POST>
	<button type=submit style="background: green; padding: 10px 20px; color: white; border: 1px solid #333;">Run Query</button>
	<br><br>
	<textarea id=Sql name=Sql rows=5 cols=60>${s}</textarea>
	</form></body></html>`
	return html
}
exports.CreateHTML = CreateHTML

function CreateTable(r) {
	let table;
	const style =
		`<style>
#table {border-collapse: collapse; width: 50%;}
#th, #td {text-align: left; padding: 8px; border: 1px solid #333;}
#tr:nth-child(even){background-color: #36A5C7; color: #fff;}
</style>`;
	const tab = '\t';
	const eol = '\n';
	const firstPart = `<html lang="en">${eol}<table id="table">`;
	const lastPart = `${eol}</table>${eol}</html>`;
	const trs = `${eol}<tr id="tr">${eol}${tab}`;
	const tre = `${eol}</tr>`;
	const ths = '<th id="th">';
	const the = '</th>';
	const tds = '<td id="td">';
	const tde = '</td>';
	let header = "";
	const Keys = Object.keys(r[0]);
	const kl = Keys.length;
	const Rows = Object.values(r);
	const rl = Rows.length;
	header = header + trs
	for (let i = 0; i < kl; i++) {
		header = header + ths + Keys[i] + the
	}
	header = header + tre
	let rows = "";
	for (let i = 0; i < rl; i++) {
		rows = rows + trs;
		for (let j = 0; j < kl; j++) {
			rows = rows + tds + Rows[i][Keys[j]] + tde
		}
		rows = rows + tre;
	}
	table =`${firstPart}${style}${header}${rows}${lastPart}`
	return table
}
exports.CreateTable = CreateTable
