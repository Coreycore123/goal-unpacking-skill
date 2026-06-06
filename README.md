# Goal Unpacking Skill

一个用于「目标解压」的 agent skill：当用户说出高度压缩的目标、模糊愿望、未验证自我诊断，或现实 / 心理混合困惑时，通过短回合结构化追问，把问题逐层还原成可判断的结构。

它的目的不是替用户给最终答案，而是帮助用户看清：

- 说出口的目标是目标、手段，还是安全感来源
- 当前问题更偏现实约束、心理驱动、任务定义不清、假设未验证，还是混合问题
- 哪个底层变量最影响下一步判断
- 追问应该在哪里停止
- 哪个最小动作能验证当前判断

## Compatible Agents

This skill uses the standard `SKILL.md` directory format and can be installed into:

- Codex: `~/.codex/skills/goal-unpacking`
- Claude Code: `~/.claude/skills/goal-unpacking`
- OpenClaw: `~/.openclaw/skills/goal-unpacking`
- WorkBuddy: `~/.workbuddy/skills/goal-unpacking`
- Trae: `~/.trae/skills/goal-unpacking`
- Generic agent runtimes: `~/.agents/skills/goal-unpacking`

## What It Does

The skill is designed for real conversational goal clarification. It avoids two common failure modes:

1. Jumping too quickly into advice.
2. Asking endless questions without stopping.

It works through short rounds:

1. Briefly restate the user's sentence.
2. Identify the current key split.
3. Ask only one question.
4. Wait for the user.
5. Stop once the problem nature, key assumption, and smallest validation action are clear enough.

## Best-Fit Scenarios

Use this skill when the user says things like:

- 「我想用 AI 实现场景图绘制」
- 「我要学 Codex」
- 「我觉得我需要一些企业经营管理学课程」
- 「需要谈个恋爱了」
- 「等我静下来，我就更新抖音」
- 「我是不是该换城市」
- 「我想做一个个人 IP」
- 「我没有框架指导我」

## Goal Types

The skill routes the conversation by goal type:

| Type | Example | Main Question |
|---|---|---|
| 实现型目标 | 我想用 AI 实现场景图绘制 | 这个目标最终服务什么使用场景？ |
| 学习型目标 | 我要学 Codex | 学它是为了完成哪个真实任务？ |
| 商业型目标 | 我想把课程卖得更好 | 这个目标服务什么商业结果？ |
| 缺口感知型目标 | 我觉得我需要企业经营管理课程 | 最近哪个场景让你觉得没有框架？ |
| 情绪场景抽象型目标 | 需要谈个恋爱了 | 这个想法从哪个具体场景冒出来？ |
| 前置状态型目标 | 等我静下来再更新抖音 | 这个前置状态具体是什么？ |

For business, growth, monetization, product, IP, and client-delivery questions, the skill returns to:

1. 产品形态
2. 商业意图
3. 增长逻辑
4. 增长打法
5. 风险检查

## Directory Structure

```text
goal-unpacking-skill/
├── goal-unpacking/
│   ├── SKILL.md
│   └── agents/
│       └── openai.yaml
├── install.sh
├── LICENSE
└── README.md
```

## Install

### Codex

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh codex
```

### Claude Code

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh claude
```

### OpenClaw

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh openclaw
```

### WorkBuddy

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh workbuddy
```

### Trae

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh trae
```

### Generic Agents

```bash
git clone https://github.com/Coreycore123/goal-unpacking-skill.git
cd goal-unpacking-skill
bash install.sh agents
```

## Manual Install

Copy the `goal-unpacking` folder into your runtime's skills directory:

```bash
cp -R goal-unpacking ~/.codex/skills/goal-unpacking
cp -R goal-unpacking ~/.claude/skills/goal-unpacking
cp -R goal-unpacking ~/.openclaw/skills/goal-unpacking
cp -R goal-unpacking ~/.workbuddy/skills/goal-unpacking
cp -R goal-unpacking ~/.trae/skills/goal-unpacking
cp -R goal-unpacking ~/.agents/skills/goal-unpacking
```

Use only the destination that matches your agent runtime.

## Usage Examples

```text
Use $goal-unpacking to help me unpack this goal: I want to learn Codex.
```

```text
用 goal-unpacking 帮我拆一下：我觉得我需要一些企业经营管理学课程了。
```

```text
Use $goal-unpacking. I think I should finish client work first, then come back to updating Douyin.
```

## Output Style

By default, the skill does not produce a long framework. It uses short rounds:

```text
你说的是：...

这一层先不判断对错。当前关键分叉是：...

我只问一个问题：

...
```

When enough has surfaced, it stops:

```text
先停在这里，不继续追问了。

目前可以临时判断：

- 问题性质：...
- 关键假设：...
- 已经看清的部分：...
- 还不确定的部分：...

最小验证动作：

...
```

## Privacy Boundary

This repository contains the public goal-unpacking method and prompt structure. It does not contain private conversations, personal notes, business data, or client materials.

## License

MIT License

