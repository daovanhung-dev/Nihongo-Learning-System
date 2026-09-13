import { Component, input } from '@angular/core';

@Component({
  selector: 'app-furigana-text',
  standalone: true,
  template: `<ruby class="jp">{{ text() }}<rt>{{ reading() }}</rt></ruby>`,
  styles: [`ruby{font-family:"Noto Sans JP",sans-serif} rt{font-size:.45em;color:var(--text-muted)}`],
})
export class FuriganaTextComponent {
  readonly text = input.required<string>();
  readonly reading = input.required<string>();
}
