-- ============================================================
-- 040_ai_openrouter.sql — Añade OpenRouter como provider AI
--
-- Amplía el CHECK constraint de ai_configs.provider para incluir
-- 'openrouter'. OpenRouter expone la misma API Chat Completions
-- que OpenAI en https://openrouter.ai/api/v1/chat/completions —
-- el adaptador TypeScript lo despacha sin columnas adicionales.
--
-- Idempotent — safe to run multiple times.
-- ============================================================

ALTER TABLE ai_configs
  DROP CONSTRAINT IF EXISTS ai_configs_provider_check;

ALTER TABLE ai_configs
  ADD CONSTRAINT ai_configs_provider_check
    CHECK (provider IN ('openai', 'anthropic', 'openrouter'));
