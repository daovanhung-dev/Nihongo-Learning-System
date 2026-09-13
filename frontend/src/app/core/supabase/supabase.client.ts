import { createClient } from '@supabase/supabase-js';
import { environment } from '../../../environments/environment';

if (!environment.supabaseUrl || !environment.supabasePublishableKey) {
  console.warn('Supabase public environment values are not configured yet.');
}

export const supabase = createClient(
  environment.supabaseUrl || 'https://invalid.local',
  environment.supabasePublishableKey || 'not-configured',
  {
    auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: true },
  },
);
