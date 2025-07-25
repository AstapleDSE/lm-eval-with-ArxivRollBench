# 🚀 ArxivRollBench
*“Fresh from ArXiv, served once, and never reheated.”*

> 📌 TL;DR: ArxivRollBench tells you **“How much of your score is real, and how much is cheating?”**  

---

## 1. 📊 What is ArxivRollBench?

ArxivRollBench is a **dynamic, one-time-pad-inspired evaluation framework** 🛡️ that **audits** how much Large Language Models (LLMs) **over-estimate** their true abilities on public benchmarks.  

### ⚠️ Key Problems ArxivRollBench Tackles  
- **📥 Data contamination**  
  Public benchmarks (MMLU, GSM8K, etc.) often sneak into pre-training data → inflated scores.  
- **🎯 Biased overtraining**  
  Developers may “teach to the test,” tuning models only on popular domains.  
- **🕵️ Transparency crisis**  
  Private leaderboards (SEAL, Chatbot Arena) are opaque & hard to reproduce.

---

### 🧪 How ArxivRollBench Works  

1. **🌱 Fresh Test Cases**  
   Every 6 months we scrape **latest ArXiv preprints** (Apr–Sep 2024 → ArxivBench-2024b).  
   > 🏷️ Domains: CS, Math, Physics, Bio, Econ, Finance, Statistics, EE.

2. **🎲 SCP Tasks**  
   Articles are auto-converted into three symbolic tasks:  
   - **Sequencing** 🔀 → Re-order shuffled sentences.  
   - **Cloze** 🕳️ → Fill masked sentences.  
   - **Prediction** 🔮 → Choose the correct next sentence.  

3. **📈 Rugged Scores (RS)**  
   - **RS-I** 🧪 = % inflation on public vs. private benchmarks.  
   - **RS-II** ⚖️ = performance variance across domains (biased training detector).

---

### 🌟 Unique Features  
- **🕐 One-Time Use**: private benchmarks are **used once**, then **expired & open-sourced**.  
- **✅ High Quality**: filtered for length, complexity, minimal math/tables.  
- **🌍 Broad Coverage**: 8 domains, ~100-word contexts, 1 k+ samples per domain.

---

## 👩‍💻 2. How Do I Evaluate my Model?

The most easy way is to use `llm-eval-harness`

Just install `lm-eval`.
and then evaluate a huggingface model with:

```sh

	lm_eval\
	    --model hf\
	    --model_args pretrained=your-model-name,parallelize=True\
	    --tasks any-arxivrollbench-task\
	    --verbosity DEBUG\
	    --log_samples\
	    --output_path your-log-path

```
















