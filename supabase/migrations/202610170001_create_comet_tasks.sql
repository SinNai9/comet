create extension if not exists pgcrypto;

create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null check (char_length(trim(title)) between 1 and 240),
  content text not null default '',
  tips text not null default '',
  task_date date not null,
  task_time time without time zone,
  deadline date,
  category text not null check (category in ('Working', 'Learning')),
  priority smallint not null default 3 check (priority between 1 and 3),
  result_status text not null default 'pending' check (result_status in ('pending', 'completed', 'satisfied', 'improve')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists tasks_user_date_idx on public.tasks (user_id, task_date);
create index if not exists tasks_user_deadline_idx on public.tasks (user_id, deadline) where result_status = 'pending';

alter table public.tasks enable row level security;

drop policy if exists "Users can read their own tasks" on public.tasks;
drop policy if exists "Users can create their own tasks" on public.tasks;
drop policy if exists "Users can update their own tasks" on public.tasks;
drop policy if exists "Users can delete their own tasks" on public.tasks;

create policy "Users can read their own tasks" on public.tasks for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users can create their own tasks" on public.tasks for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users can update their own tasks" on public.tasks for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users can delete their own tasks" on public.tasks for delete to authenticated using ((select auth.uid()) = user_id);

create or replace function public.set_updated_at() returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists tasks_updated_at on public.tasks;
create trigger tasks_updated_at before update on public.tasks for each row execute function public.set_updated_at();

revoke all on table public.tasks from anon;
grant select, insert, update, delete on table public.tasks to authenticated;
