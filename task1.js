let s1 = '5 * (4 - 2)';
let s2 = '5 * (4 - 2(';
let s3 = '5 * )4 - 2(';
let s4 = ')()(';

function isValid(s) {
	let count = 0;
	for (let i = 0; i < s.length; i++) {
		if (s[i] == '(') {
			count++;
		} else if (s[i] == ')') {
			count--;
		}
		if (count < 0) return ('ошибка')
	}
	if (count === 0) return ('всё ок'); else return ('ошибка');
}

console.log(s1, isValid(s1));
console.log(s2, isValid(s2));
console.log(s3, isValid(s3));
console.log(s4, isValid(s4));