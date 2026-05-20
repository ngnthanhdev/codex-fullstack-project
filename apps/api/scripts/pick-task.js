#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const isCheck = process.argv.includes("--check");
const tasksDir = path.resolve(process.cwd(), "tasks");

if (!fs.existsSync(tasksDir)) {
  console.error("No tasks directory found.");
  process.exit(1);
}

const files = fs
  .readdirSync(tasksDir)
  .filter((name) => name.endsWith(".md"))
  .sort((a, b) => {
    const layerA = Number((a.match(/layer-(\d+)/) || [])[1] ?? 999);
    const layerB = Number((b.match(/layer-(\d+)/) || [])[1] ?? 999);
    return layerA - layerB || a.localeCompare(b);
  });

const todoPattern = /^- \[ \] (.+)$/m;

for (const file of files) {
  const fullPath = path.join(tasksDir, file);
  const content = fs.readFileSync(fullPath, "utf8");
  const match = content.match(todoPattern);
  if (match) {
    if (isCheck) {
      console.log(`Next task exists in tasks/${file}`);
      process.exit(0);
    }
    console.log(`Next task: ${match[1]}`);
    console.log(`File: tasks/${file}`);
    process.exit(0);
  }
}

if (isCheck) {
  console.log("No todo tasks found.");
  process.exit(0);
}

console.log("No todo tasks found.");
