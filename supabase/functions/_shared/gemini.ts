export function getGeminiApiKey(): string {
  const key = Deno.env.get('GEMINI_API_KEY');
  if (!key) throw new Error('GEMINI_API_KEY is not configured');
  return key;
}

// TODO: implement the project-approved Gemini SDK/REST wrapper here.
// Keep model names and prompt versions centralized instead of hard-coding them in every function.
