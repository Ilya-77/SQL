-- Index for goods
CREATE INDEX goods_name_idx ON goods(name);

-- Indexes for categorys
CREATE INDEX categorys_short_desription_idx ON catalogs(category, short_description);

-- Indexes for sub-categorys
CREATE INDEX subcategorys_short_desription_idx ON sub_categorys(name, short_description);

-- Index for profiles
CREATE INDEX profiles_first_name_last_name_idx ON profiles(first_name, last_name);

