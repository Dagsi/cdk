import {Suspense} from 'react';
import {ProjectMain} from '@/components/common/project';
import {Metadata} from 'next';

export const metadata: Metadata = {
  title: '创建项目',
};

export default function ProjectPage() {
  return (
    <div className="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <Suspense>
        <ProjectMain />
      </Suspense>
    </div>
  );
}
