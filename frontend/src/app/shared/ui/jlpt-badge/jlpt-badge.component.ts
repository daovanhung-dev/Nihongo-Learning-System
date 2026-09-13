import { Component, input } from '@angular/core';

@Component({
  selector: 'app-jlpt-badge',
  standalone: true,
  template: '<span class="badge" [attr.data-level]="level()">{{ level() }}</span>',
  styles: [`
    .badge { display:inline-flex; align-items:center; height:24px; padding:0 10px; border-radius:999px; font-size:11px; font-weight:700; }
    .badge[data-level="N5"]{color:#178365;background:rgba(68,199,161,.12)}
    .badge[data-level="N4"]{color:#07839a;background:rgba(6,182,212,.12)}
    .badge[data-level="N3"]{color:#4f5cf6;background:rgba(79,92,246,.12)}
    .badge[data-level="N2"]{color:#6944e5;background:rgba(124,99,255,.12)}
    .badge[data-level="N1"]{color:#9333ea;background:rgba(147,51,234,.12)}
  `],
})
export class JlptBadgeComponent { readonly level = input<'N5'|'N4'|'N3'|'N2'|'N1'>('N5'); }
