#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const args = process.argv.slice(2);

function usage() {
  console.log(`Usage:
  node scripts/add-task.js "Task title"
  node scripts/add-task.js --layer 1 "Task title"
  node scripts/add-task.js --file tasks/layer-refinement-todo.md "Task title"
`);
}

let layer = "0";
let file = null;
const titleParts = [];

for (let i = 0; i < args.length; i += 1) {
  const arg = args[i];
  if (arg === "--layer") {
    layer = args[i + 1];
    i += 1;
  } else if (arg === "--file") {
    file = args[i + 1];
    i += 1;
  } else if (arg === "--help" || arg === "-h") {
    usage();
    process.exit(0);
  } else {
    titleParts.push(arg);
  }
}

const title = titleParts.join(" ").trim();

if (!title) {
  usage();
  process.exit(1);
}

const target = file || path.join("tasks", `layer-${layer}-todo.md`);
const absoluteTarget = path.resolve(process.cwd(), target);

if (!fs.existsSync(absoluteTarget)) {
  fs.mkdirSync(path.dirname(absoluteTarget), { recursive: true });
  fs.writeFileSync(
    absoluteTarget,
    `# Layer ${layer} Todo\n\n## Todo\n\n## Done Criteria\n\n- [ ] Define done criteria.\n`,
  );
}

const body = fs.readFileSync(absoluteTarget, "utf8");
const task = `- [ ] ${title}\n`;

let nextBody;
if (body.includes("## Todo\n")) {
  nextBody = body.replace("## Todo\n", `## Todo\n\n${task}`);
} else {
  nextBody = `${body.trim()}\n\n## Todo\n\n${task}`;
}

fs.writeFileSync(absoluteTarget, nextBody);
console.log(`Added task to ${target}: ${title}`);
