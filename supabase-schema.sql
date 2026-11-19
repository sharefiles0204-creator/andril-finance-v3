-- Andril Finance private per-account storage (Supabase)
create table if not exists public.projects (
 id uuid not null, user_id uuid not null references auth.users(id) on delete cascade,
 data jsonb not null, updated_at timestamptz not null default now(),
 constraint projects_user_record_pk primary key (user_id,id));
create table if not exists public.transactions (
 id uuid not null, user_id uuid not null references auth.users(id) on delete cascade,
 data jsonb not null, updated_at timestamptz not null default now(),
 constraint transactions_user_record_pk primary key (user_id,id));
alter table public.projects enable row level security;
alter table public.transactions enable row level security;
drop policy if exists "Users can manage own projects" on public.projects;
drop policy if exists "Users can manage own transactions" on public.transactions;
create policy "Users can manage own projects" on public.projects for all to authenticated
 using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
create policy "Users can manage own transactions" on public.transactions for all to authenticated
 using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
revoke all on public.projects from anon; revoke all on public.transactions from anon;
grant select,insert,update,delete on public.projects to authenticated;
grant select,insert,update,delete on public.transactions to authenticated;

create table if not exists public.rentals (
 id uuid not null, user_id uuid not null references auth.users(id) on delete cascade,
 data jsonb not null, updated_at timestamptz not null default now(),
 constraint rentals_user_record_pk primary key (user_id,id));
alter table public.rentals enable row level security;
drop policy if exists "Users can manage own rentals" on public.rentals;
create policy "Users can manage own rentals" on public.rentals for all to authenticated
 using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
revoke all on public.rentals from anon;
grant select,insert,update,delete on public.rentals to authenticated;
