-- Minimal development seed. Expand with a validated Japanese dataset before production.
insert into public.kana_characters(character, script_type, romaji, row_name, column_name, category)
values
('あ','HIRAGANA','a','A','A','BASIC'),
('い','HIRAGANA','i','A','I','BASIC'),
('う','HIRAGANA','u','A','U','BASIC'),
('え','HIRAGANA','e','A','E','BASIC'),
('お','HIRAGANA','o','A','O','BASIC'),
('ア','KATAKANA','a','A','A','BASIC'),
('イ','KATAKANA','i','A','I','BASIC'),
('ウ','KATAKANA','u','A','U','BASIC'),
('エ','KATAKANA','e','A','E','BASIC'),
('オ','KATAKANA','o','A','O','BASIC')
on conflict (character) do nothing;

insert into public.kanji_characters(character, meanings_vi, onyomi, kunyomi, radical, stroke_count, jlpt_level)
values
('日', array['ngày','mặt trời'], array['ニチ','ジツ'], array['ひ','か'], '日', 4, 'N5'),
('本', array['sách','gốc'], array['ホン'], array['もと'], '木', 5, 'N5'),
('食', array['ăn','thức ăn'], array['ショク'], array['た.べる','く.う'], '食', 9, 'N5')
on conflict (character) do nothing;
