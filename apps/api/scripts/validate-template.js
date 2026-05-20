#!/usr/bin/env node

const fs = require("fs");

const requiredFiles = [
  "AGENTS.md",
  "README.md",
  "docs/BRIEF.md",
  "docs/SPECIFICATIONS.md",
  "docs/ARCHITECTURE.md",
  "docs/NESTJS_SKILLS.md",
  "tasks/layer-0-todo.md",
  "scripts/start-project.sh",
];

const missing = requiredFiles.filter((file) => !fs.existsSync(file));

if (missing.length > 0) {
  console.error(`Missing required files:\n${missing.join("\n")}`);
  process.exit(1);
}

const nestjsSkill = "skills/nestjs/agent-nestjs-skills/SKILL.md";
if (!fs.existsSync(nestjsSkill)) {
  console.warn(
    `Warning: ${nestjsSkill} is missing. Restore it from Kadajett/agent-nestjs-skills.`,
  );
} else {
  console.log("NestJS skill is present.");
}

console.log("Template validation passed.");
