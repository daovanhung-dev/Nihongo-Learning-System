import { Injectable, signal } from '@angular/core';
import type { Session, User } from '@supabase/supabase-js';
import { supabase } from '../supabase/supabase.client';

@Injectable({ providedIn: 'root' })
export class AuthService {
  readonly session = signal<Session | null>(null);
  readonly user = signal<User | null>(null);

  async initialize(): Promise<void> {
    const { data } = await supabase.auth.getSession();
    this.session.set(data.session);
    this.user.set(data.session?.user ?? null);
  }

  async signIn(email: string, password: string) {
    return supabase.auth.signInWithPassword({ email, password });
  }

  async signOut() {
    return supabase.auth.signOut();
  }
}
